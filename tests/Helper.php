<?php

declare(strict_types=1);

/*
 * This file is part of the ************************ package.
 * _____________                           _______________
 *  ______/     \__  _____  ____  ______  / /_  _________
 *   ____/ __   / / / / _ \/ __`\/ / __ \/ __ \/ __ \___
 *    __/ / /  / /_/ /  __/ /  \  / /_/ / / / / /_/ /__
 *      \_\ \_/\____/\___/_/   / / .___/_/ /_/ .___/
 *         \_\                /_/_/         /_/
 *
 * The PHP Framework For Code Poem As Free As Wind. <Query Yet Simple>
 * (c) 2010-2018 http://queryphp.com All rights reserved.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Tests;

use ReflectionClass;
use ReflectionMethod;
use ReflectionProperty;

/**
 * 助手方法.
 *
 * @author Xiangmin Liu <635750556@qq.com>
 *
 * @since 2017.05.09
 *
 * @version 1.0
 */
trait Helper
{
    protected function invokeTestMethod($classObj, string $method, array $args = [])
    {
        $method = $this->parseTestMethod($classObj, $method);

        if ($args) {
            return $method->invokeArgs($classObj, $args);
        }

        return $method->invoke($classObj);
    }

    protected function invokeTestStaticMethod($classOrObject, string $method, array $args = [])
    {
        $method = $this->parseTestMethod($classOrObject, $method);

        if ($args) {
            return $method->invokeArgs(null, $args);
        }

        return $method->invoke(null);
    }

    protected function getTestProperty($classOrObject, string $prop)
    {
        return $this->parseTestProperty($classOrObject, $prop)->
        getValue($classOrObject);
    }

    protected function setTestProperty($classOrObject, string $prop, $value)
    {
        $this->parseTestProperty($classOrObject, $prop)->

        setValue($value);
    }

    protected function parseTestProperty($classOrObject, string $prop): ReflectionProperty
    {
        $reflected = new ReflectionClass($classOrObject);
        $property = $reflected->getProperty($prop);
        $property->setAccessible(true);

        return $property;
    }

    protected function parseTestMethod($classOrObject, string $method): ReflectionMethod
    {
        $method = new ReflectionMethod($classOrObject, $method);
        $method->setAccessible(true);

        return $method;
    }

    protected function normalizeContent(string $content): string
    {
        return str_replace([' ', "\t", "\n", "\r"], '', $content);
    }

    protected function varJson(array $data, ?int $id = null)
    {
        $method = debug_backtrace()[1]['function'].$id;

        list($traceDir, $className) = $this->makeLogsDir();

        file_put_contents(
            $traceDir.'/'.sprintf('%s::%s.json', $className, $method),
            $result = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT)
        );

        return $result;
    }

    protected function makeLogsDir(): array
    {
        $tmp = explode('\\', static::class);
        array_shift($tmp);
        $className = array_pop($tmp);
        $traceDir = dirname(__DIR__).'/logs/tests/'.implode('/', $tmp);

        if (!is_dir($traceDir)) {
            mkdir($traceDir, 0777, true);
        }

        return [$traceDir, $className];
    }

    protected function assertTimeRange($data, ...$timeRange)
    {
        return $this->assertTrue(in_array($data, $timeRange, true));
    }
}
