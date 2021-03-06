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

use BadMethodCallException;
use Closure;
use Leevel\Support\IMacro;

/**
 * 字符串.
 *
 * @author Xiangmin Liu <635750556@qq.com>
 *
 * @since 2017.04.05
 *
 * @version 1.0
 */
class Str implements IMacro
{
    /**
     * 注册的动态扩展
     *
     * @var array
     */
    protected static macro = [];

    /**
     * 随机字母数字.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randAlphaNum(int length, var charBox = null) -> string
    {
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        }

        return static::randStr(length, charBox);
    }
    
    /**
     * 随机小写字母数字.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randAlphaNumLowercase(int length, var charBox = null) -> string
    {
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "abcdefghijklmnopqrstuvwxyz1234567890";
        } else {
            let charBox = strtolower(charBox);
        }

        return static::randStr(length, charBox);
    }
    
    /**
     * 随机大写字母数字.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randAlphaNumUppercase(int length, var charBox = null) -> string
    {
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        } else {
            let charBox = strtoupper(charBox);
        }

        return static::randStr(length, charBox);
    }
    
    /**
     * 随机字母.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randAlpha(int length, var charBox = null) -> string
    {
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        }

        return static::randStr(length, charBox);
    }
    
    /**
     * 随机小写字母.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randAlphaLowercase(int length, var charBox = null) -> string
    {
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "abcdefghijklmnopqrstuvwxyz";
        } else {
            let charBox = strtolower(charBox);
        }

        return static::randStr(length, charBox);
    }
    
    /**
     * 随机大写字母.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randAlphaUppercase(int length, var charBox = null) -> string
    {
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        } else {
            let charBox = strtoupper(charBox);
        }

        return static::randStr(length, charBox);
    }
    
    /**
     * 随机数字.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randNum(int length, var charBox = null) -> string
    {
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "0123456789";
        }

        return static::randStr(length, charBox);
    }
    
    /**
     * 随机字中文.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randChinese(int length, var charBox = null) -> string
    {
        var result, i;
    
        if ! (length) {
            return "";
        }

        if charBox === null {
            let charBox = "在了不和有大这主中人上为们地个用工时要动国产以我到他会" .
                "作来分生对于学下级就年阶义发成部民可出能方进同行面说种过命度革而" .
                "多子后自社加小机也经力线本电高量长党得实家定深法表着水理化争现所" .
                "二起政三好十战无农使性前等反体合斗路图把结第里正新开论之物从当两" .
                "些还天资事队批如应形想制心样干都向变关点育重其思与间内去因件日利" .
                "相由压员气业代全组数果期导平各基或月毛然问比展那它最及外没看治提" .
                "五解系林者米群头意只明四道马认次文通但条较克又公孔领军流入接席位" .
                "情运器并飞原油放立题质指建区验活众很教决特此常石强极土少已根共直" .
                "团统式转别造切九您取西持总料连任志观调七么山程百报更见必真保热委" .
                "手改管处己将修支识病象几先老光专什六型具示复安带每东增则完风回南" .
                "广劳轮科北打积车计给节做务被整联步类集号列温装即毫知轴研单色坚据" .
                "速防史拉世设达尔场织历花受求传口断况采精金界品判参层止边清至万确" .
                "究书术状厂须离再目海交权且儿青才证低越际八试规斯近注办布门铁需走" .
                "议县兵固除般引齿千胜细影济白格效置推空配刀叶率述今选养德话查差半" .
                "敌始片施响收华觉备名红续均药标记难存测士身紧液派准斤角降维板许破" .
                "述技消底床田势端感往神便贺村构照容非搞亚磨族火段算适讲按值美态黄" .
                "易彪服早班麦削信排台声该击素张密害侯草何树肥继右属市严径螺检左页" .
                "抗苏显苦英快称坏移约巴材省黑武培着河帝仅针怎植京助升王眼她抓含苗" .
                "副杂普谈围食射源例致酸旧却充足短划剂宣环落首尺波承粉践府鱼随考刻" .
                "靠够满夫失包住促枝局菌杆周护岩师举曲春元超负砂封换太模贫减阳扬江" .
                "析亩木言球朝医校古呢稻宋听唯输滑站另卫字鼓刚写刘微略范供阿块某功" .
                "套友限项余倒卷创律雨让骨远帮初皮播优占死毒圈伟季训控激找叫云互跟" .
                "裂粮粒母练塞钢顶策双留误础吸阻故寸盾晚丝女散焊功株亲院冷彻弹错散" .
                "商视艺灭版烈零室轻血倍缺厘泵察绝富城冲喷壤简否柱李望盘磁雄似困巩" .
                "益洲脱投送奴侧润盖挥距触星松送获兴独官混纪依未突架宽冬章湿偏纹吃" .
                "执阀矿寨责熟稳夺硬价努翻奇甲预职评读背协损棉侵灰虽矛厚罗泥辟告卵" .
                "箱掌氧恩爱停曾溶营终纲孟钱待尽俄缩沙退陈讨奋械载胞幼哪剥迫旋征槽" .
                "倒握担仍呀鲜吧卡粗介钻逐弱脚怕盐末阴丰编印蜂急拿扩伤飞露核缘游振" .
                "操央伍域甚迅辉异序免纸夜乡久隶缸夹念兰映沟乙吗儒杀汽磷艰晶插埃燃" .
                "欢铁补咱芽永瓦倾阵碳演威附牙芽永瓦斜灌欧献顺猪洋腐请透司危括脉宜" .
                "笑若尾束壮暴企菜穗楚汉愈绿拖牛份染既秋遍锻玉夏疗尖殖井费州访吹荣" .
                "铜沿替滚客召旱悟刺脑的一是";
        }

        let result = "";
        let i = 0;
        let length--;

        for i in range(0, length) {
            let result .= static::substr(
                charBox,
                intval(floor(mt_rand(0, mb_strlen(charBox, "utf-8") - 1))),
                1
            );
        }

        let charBox = null;
        
        return result;
    }
    
    /**
     * 随机字符串.
     *
     * @param int    $length
     * @param string $charBox
     *
     * @return string
     */
    public static function randStr(int length, var charBox) -> string
    {
        if ! (length) || ! (charBox) {
            return "";
        }

        return substr(str_shuffle(charBox), 0, length);
    }
    
    /**
     * 字符串编码转换.
     *
     * @param mixed  $contents
     * @param string $fromChar
     * @param string $toChar
     *
     * @return mixed
     */
    public static function strEncoding(var contents, string fromChar, string toChar = "utf-8")
    {
        var key, val, tmp;
    
        if empty(contents) ||
            ! (is_array(contents)) && ! (is_string(contents)) || 
            strtolower(fromChar) === strtolower(toChar) {
            return contents;
        }

        if is_string(contents) {
            return mb_convert_encoding(contents, toChar, fromChar);
        }

        for key, val in contents {
            let tmp = static::strEncoding(key, fromChar, toChar);
            let contents[tmp] = static::strEncoding(val, fromChar, toChar);

            if key !== tmp {
                unset contents[tmp];
            }
        }

        return contents;
    }
    
    /**
     * 字符串截取.
     *
     * @param string $strings
     * @param int    $start
     * @param int    $length
     * @param string $charset
     *
     * @return string
     */
    public static function substr(string strings, int start = 0, int length = 255, string charset = "utf-8") -> string
    {
        return mb_substr(strings, start, length, charset);
    }
    
    /**
     * 日期格式化.
     *
     * @param int    $dateTemp
     * @param array  $lang
     * @param string $dateFormat
     *
     * @return string
     */
    public static function formatDate(int dateTemp, array! lang = [], string dateFormat = "Y-m-d H:i") -> string
    {
        var sec, hover, min;
    
        let sec = time() - dateTemp;

        if sec < 0 {
            return date(dateFormat, dateTemp);
        }

        let hover = intval(floor(sec / 3600));

        if 0 === hover {
            let min = intval(floor(sec / 60));

            if 0 === min {
                return sec . " " . (isset lang["seconds"] ? lang["seconds"] : "seconds ago");
            }

            return min . " " . (isset lang["minutes"] ? lang["minutes"] : "minutes ago");
        } elseif hover < 24 {
            return hover . " " . (isset lang["hours"] ? lang["hours"] : "hours ago");
        }

        return date(dateFormat, dateTemp);
    }
    
    /**
     * 文件大小格式化.
     *
     * @param int  $fileSize
     * @param bool $withUnit
     *
     * @return string
     */
    public static function formatBytes(int fileSize, bool withUnit = true) -> string
    {
        var tmp;

        if fileSize >= 1073741824 {
            let tmp = round(fileSize / 1073741824, 2) . (withUnit ? "G" : "");
        } elseif fileSize >= 1048576 {
            let tmp = round(fileSize / 1048576, 2) . (withUnit ? "M" : "");
        } elseif fileSize >= 1024 {
            let tmp = round(fileSize / 1024, 2) . (withUnit ? "K" : "");
        } else {
            let tmp = fileSize . (withUnit ? "B" : "");
        }

        return tmp;
    }
    
    /**
     * 下划线转驼峰.
     *
     * @param string $value
     * @param string $separator
     *
     * @return string
     */
    public static function camelize(string value, string separator = "_") -> string
    {
        var tmp;

        if false === strpos(value, separator) {
            return value;
        }

        let tmp = separator.str_replace(separator, " ", strtolower(value));

        return ltrim(str_replace(" ", "", ucwords(tmp)), separator);
    }
    
    /**
     * 驼峰转下划线
     *
     * @param string $value
     * @param string $separator
     *
     * @return string
     */
    public static function unCamelize(string value, string separator = "_") -> string
    {
        return strtolower(
            preg_replace(
                "/([a-z])([A-Z])/",
                "$1" . separator . "$2",
                value
            )
        );
    }
    
    /**
     * 判断字符串中是否包含给定的字符开始.
     *
     * @param string $toSearched
     * @param string $search
     *
     * @return bool
     */
    public static function startsWith(string toSearched, string search) -> bool
    {
        if search !== "" && 
            0 === strpos(toSearched, search) {
            return true;
        }

        return false;
    }
    
    /**
     * 判断字符串中是否包含给定的字符结尾.
     *
     * @param string $toSearched
     * @param string $search
     *
     * @return bool
     */
    public static function endsWith(string toSearched, string search) -> bool
    {
        if strval(search) === substr(toSearched, -strlen(search)) {
            return true;
        }

        return false;
    }
    
    /**
     * 判断字符串中是否包含给定的字符串集合.
     *
     * @param string $toSearched
     * @param string $search
     *
     * @return bool
     */
    public static function contains(string toSearched, string search) -> bool
    {
        if search !== "" 
            && strpos(toSearched, search) !== false {
            return true;
        }

        return false;
    }

    /**
     * 注册一个扩展
     *
     * @param string $name
     * @param callable $macro
     * @return void
     */
    public static function macro(string name, <Closure> macro)
    {
        let self::macro[name] = macro;
    }
    
    /**
     * 判断一个扩展是否注册
     *
     * @param string $name
     * @return bool
     */
    public static function hasMacro(string name) -> boolean
    {
        return isset self::macro[name];
    }

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
    public static function callStaticMacro(string method, array args)
    {
        if self::hasMacro(method) {
            return call_user_func_array(self::macro[method], args);
        }

        throw new BadMethodCallException(sprintf("Method %s is not exits.", method));
    }

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
    public function callMacro(string method, array args)
    {
        if self::hasMacro(method) {
            if self::macro[method] instanceof Closure {
                return call_user_func_array(self::macro[method]->bindTo(this), args);
            } else {
                return call_user_func_array(self::macro[method], args);
            }
        }

        throw new BadMethodCallException(sprintf("Method %s is not exits.", method));
    }
}
