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
namespace Leevel\Event;

use Leevel\Di\Provider;

/**
 * 事件服务提供者
 *
 * @author Xiangmin Liu <635750556@qq.com>
 *
 * @since 2018.02.01
 *
 * @version 1.0
 */
abstract class EventProvider extends Provider
{
    /**
     * 监听器列表
     *
     * @var array
     */
    protected listeners = [];

    /**
     * 注册时间监听器
     *
     * @param \Leevel\Event\IDispatch $dispatch
     * @return void
     */
    public function bootstrap(<IDispatch> dispatch)
    {
        var event, listeners, key, item;

        for event, listeners in this->get() {
            for key, item in listeners {
                if is_int(item) {
                    dispatch->register(event, key, item);
                } else {
                    dispatch->register(event, item);
                }
            }
        }
    }

    /**
     * 注册一个提供者
     *
     * @return void
     */
    public function register()
    {
    }

    /**
     * 取得监听器
     *
     * @return array
     */
    public function get() -> array
    {
        return this->listeners;
    }
}
