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
namespace Leevel\Support;

use Closure;

/**
 * 实现类的无限扩展功能
 *
 * @author Xiangmin Liu <635750556@qq.com>
 *
 * @since 2018.02.04
 * @version 1.0
 */
interface IMacro
{

    /**
     * 注册一个扩展
     *
     * @param string $name
     * @param \Closure $macro
     * @return void
     */
    public static function macro(string name, <Closure> macro);
    
    /**
     * 判断一个扩展是否注册
     *
     * @param string $name
     * @return bool
     */
    public static function hasMacro(string name) -> boolean;

    /**
     * __callStatic 魔术方法隐射
     * 由于 zephir 对应的 C 扩展版本不支持对象内绑定 class
     * 即 Closure::bind($closures, null, get_called_class())
     * 为保持功能一致，所以取消 PHP 版本的静态闭包绑定功能
     *
     * @param string $method
     * @param array $args
     * @return mixed
     */
    public static function callStaticMacro(string method, array args);

    /**
     * __call 魔术方法隐射
     * 由于 zephir 对应的 C 扩展版本不支持对象内绑定 class
     * 即 Closure::bind($closures, null, get_called_class())
     * 为保持功能一致，所以绑定对象但是不绑定作用域，即可以使用 $this,只能访问 public 属性
     * 
     * @param string $method
     * @param array $args
     * @return mixed
     */
    public function callMacro(string method, array args);
}
