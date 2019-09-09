#include demo.ahk

/*
不打算修改程序本身，只想为某个按键实现功能的话，可以在这里：
1. 添加 keyfunc_xxxx() 的函数，
2. 在 Capslock+settings.ini [keys]下添加设置，
例如按下面这样写，然后添加设置：caps_f7=keyFunc_test2(apple)
3. 保存，重载 capslock+ (capslock+F5)
4. 按下 capslock+F7 试试
***********************************************


keyfunc_test2(str){
  msgbox, % str
  return
}
*/


keyFunc_copy_percy1(){
    global
    Clipboard:=""
    SendInput, ^{insert}
    ClipWait, 0.1
    if (ErrorLevel)
    {
        SendInput,{home}+{End}^{insert}{End}
        ClipWait, 0.1
    }
    if (!ErrorLevel)
    {
        clipSaver("c")
    }
    return
}

keyFunc_paste_percy1(){
    global
    clipboard = %clipboard%
    SendInput, +{Insert} ;-percy：這裏改成了shift+insert 適配xshell中的粘貼
    Return
}