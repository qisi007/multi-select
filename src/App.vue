<template>
  <div id="app">
    <section>
      <h1>multi-select(多列选择器)</h1>
      <h3>组件预览</h3>
    </section>
    <super-multi-select
      v-model="value"
      :options="optionsData"
      :placeholder="placeholder"
      style="margin-top: 30px"
    >
    </super-multi-select>
    <MdDocument />
  </div>
</template>
<script>
import { Vue, Component } from "vue-property-decorator";
import SuperMultiSelect from "./components/SuperMultiSelect.vue";
import MdDocument from "./components/test.md";

export default  {
    components: {
        SuperMultiSelect,
        MdDocument,
    },
    data () {
        return {
            value: [],
            placeholder: "请选择",
            optionsData:  [
                [
                    {
                        "label": "鲁班七号",
                        "value": "鲁班七号"
                    },
                    {
                        "label": "安琪拉",
                        "value": "安琪拉"
                    },
                    {
                        "label": "项羽",
                        "value": "项羽"
                    },
                    {
                        "label": "廉颇",
                        "value": "廉颇"
                    },
                    {
                        "label": "庄周",
                        "value": "庄周"
                    }
                ],
                [
                    {
                        "label": "输出",
                        "value": "输出"
                    },
                    {
                        "label": "法师",
                        "value": "法师"
                    },
                    {
                        "label": "坦克",
                        "value": "坦克"
                    },
                    {
                        "label": "战士",
                        "value": "战士"
                    },
                    {
                        "label": "庄周",
                        "value": "庄周"
                    },
                    {
                        "label": "庄周",
                        "value": "庄周"
                    },
                    {
                        "label": "庄周",
                        "value": "庄周"
                    }
                ],
                [
                    {
                        "label": "上路",
                        "value": "上路"
                    },
                    {
                        "label": "打野",
                        "value": "打野"
                    },
                    {
                        "label": "中路",
                        "value": "中路"
                    },
                    {
                        "label": "下路",
                        "value": "下路"
                    },
                    {
                        "label": "辅助",
                        "value": "辅助"
                    }
                ]
            ]
        }
    }
}
</script>
<style lang="stylus">
#app {
  width: 80%;
  margin: 0 auto;
}
</style>

