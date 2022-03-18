

### 电商后台管理系统



该项目是一个简易电商后台管理系统, 使用的技术如下

前端: vue3 + ts + vite + axios + element plus

后端: springboot + mybatis + mysql



前端项目介绍

- 使用 Vite 搭建项目，按需加载使用文件，启动迅速

- 使用了 Vue3 中的 script setup 写法, 可用于建立组合逻辑, 创建响应式数据, 创建通用函数等能力
- 使用 axios 请求后端接口



界面使用了 flex 布局, 左侧宽度300px, 右侧内容自适应

#### 动态读取路由

左侧菜单读取为动态写法, 通过 v-for , 遍历读取所有的路由, 当添加, 删除路由时, 不用手动修改

```html
<el-menu
  class="el_menu"
  :router="true"
  :default-openeds="defaultOpen"
  :default-active="$route.path"
>
  <template v-for="(menu, index) in allRouteSrc">
    <el-sub-menu :index="index.toString()">
      <template #title>
        <span style="font-weight: bold;">{{ menu.meta!.title }}</span>
      </template>
      <el-menu-item-group>
        <template v-for="item in menu.children">
          <el-menu-item :index="item.path">
            <span style="font-weight: bold;">{{ item.meta!.title }}</span>
          </el-menu-item>
        </template>
      </el-menu-item-group>
    </el-sub-menu>
  </template>
</el-menu>
```

#### 组件抽取

将表格中上层标签，表单类型，校验规则等动态属性抽取到单独 attr.ts 文件中

```js
import { operation } from './attr.ts'
```

通过在 template 中使用 v-if 动态渲染对应内容

```html
<el-form :model="formModel" :rules="formRules" ref="formRef" label-width="100px">
  <el-form-item v-for="option in operation" :label="option.label" :prop="option.prop">
    <template v-if="option.operate === 'input'">
      <template v-if="option.type === 'number'">
        <el-input v-model.number="formModel[option.prop]"></el-input>
      </template>
      <template v-else>
        <el-input v-model="formModel[option.prop]"></el-input>
      </template>
    </template>
    <template v-if="option.operate === 'select'">
      <el-select v-model="formModel[option.prop]" style="width:100%" placeholder=" ">
        <el-option v-for="o in categoryData" :label="o.categoryName" :value="o.id"></el-option>
      </el-select>
    </template>
  </el-form-item>
</el-form>
```

之后, 如果想要添加新的内容, 直接修改 attr.ts 的内容就可以, 提高了代码的可读性, 可维护性





商品分类管理

![image-20220316202649338](README.assets/image-20220316202649338.png)

可进行一级分类, 二级分类的添加

![image-20220316202658098](README.assets/image-20220316202658098.png)

可以修改每页表格中所展示数据的多少

![image-20220316202722095](README.assets/image-20220316202722095.png)

进行表单操作的时候, 会进行校验, 校验成功, 才允许发送请求

![image-20220316202739308](README.assets/image-20220316202739308.png)

能够对商品进行模糊查询

![image-20220316202755428](README.assets/image-20220316202755428.png)

根据上方的下拉框, 显示属于选中类别的所有商品

![image-20220316202803870](README.assets/image-20220316202803870.png)

可添加订单

![image-20220316202823200](README.assets/image-20220316202823200.png)
