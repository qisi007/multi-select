<template>
  <div id="app" style="height: 2000px;">
     <multi-select v-model="value"
                    :options="optionsData" 
                    :placeholder="placeholder">
      </multi-select> 
  </div>
</template>
<script lang='ts'>
import { Vue, Component } from "vue-property-decorator";

@Component
export default class App extends Vue {
  private value: any = []
  private placeholder: string = "请选择"
  private optionsData: any =  [
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
];
}
</script>

