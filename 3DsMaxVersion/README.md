# Facial Rigging System

## 以下为开发需注意的规则

-[物件命名规则] 
- Locator命名：以**Loc**开头的名字，如Loc_EyeBrowRtJt001，即右侧眼眉第一根骨骼的Locator。Loc_EyeBrowUpLfCtrl001，即左侧上眼眉控制器的Locator。
- 骨骼命名：将对应的Locator名字对应给骨骼，规则是去掉Loc的前缀，改为**Jt_**.
- 控制器命名：将对应的Locator名字对应给控制器，规则是去掉Loc的前缀，改为**Ctrl_**.

-[代码文件命名规则] 
- 以功能命名文件名，**大写**，驼峰命名法。如CommonFunction.ms。


-[变量命名规则] 
- Locator变量命名：以**loc**开头为变量名称。
- 骨骼命名：以**jt**开头为变量名称。
- 控制器命名：以**ctrl**开头为变量名称。

-[函数规则]
- 命名：**大写**字母开头, 驼峰命名法，如FreezeTransform, RotatePivot.
- 注释：在函数前面加上注释，以直接能读懂为标准。

-[使用头文件规则]
- 正式使用时，仅能在**Main.ms**中使用包含头文件函数(**filein** "xxx.ms")。在测试单文件可临时使用，但提交正式代码时谨记删除掉。

-[最外层调用函数规则]
- 正式使用时，仅能在**Main.ms**中调用函数，如**Main()**。在测试单文件可临时使用，但提交正式代码时谨记删除掉。

## 以下为各文件的作用
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/Main.ms">Main.ms</a>
主函数，负责调用UI面板。
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/WindowGUI.ms">WindowGUI.ms</a>
GUI函数，负责绘制面板及相应对应的响应按钮功能。
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/WindowGUI.ms">CoomonFunction.ms</a>
通用函数，如旋转轴心、FreezeTransform。
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/Bone.ms">Bone.ms</a>
处理骨骼相关的函数，如添加骨骼、骨骼链等。
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/AssignControllerFunction.ms">AssignControllerFunction.ms</a>
添加表达式给Controller的函数，如给单轴添加旋转或位移的Float Script或是整体添加Position Script等。
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/CreateCtrlLoc.ms">CreateCtrlLoc.ms</a>
创建控制器Locator的函数，添加人工提前定位好的Controller Locator。
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/CreateJtLocator.ms">CreateJtLocator.ms</a>
创建骨骼Locator的函数，添加人工提前定位好的Joint Locator。
### <a href="https://github.com/kiiib/FacialRiggingSystem/blob/master/3DsMaxVersion/FacialRiggingSystem.ms">FacialRiggingSystem.ms</a>
处理脸部各部分创建控制器、骨骼及其相应关系流程的函数。