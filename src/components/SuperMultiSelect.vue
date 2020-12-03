<template>
  <!-- @name 多列下拉框
  -- @author liuguisheng
  -- @date 2020-2-28
  -->
  <div class="muti-select">
    <div
      class="muti-select_main"
      :class="{
        'muti-select_main_focus': selectShow,
        'muti-select_main_disabled': disabled,
      }"
      ref="selectMain"
      @click="onOpenSelect"
    >
      <p v-if="isEmptyValue" class="muti-select_placeholder">
        {{ placeholder }}
      </p>
      <p v-else>{{ countValue }}</p>
      <img
        src="./down.svg"
        class="muti-select_icon"
        :class="{ 'muti-select_icon_top': selectShow }"
      />
    </div>
    <transition name="el-zoom-in-top">
      <div class="muti-select_body" v-if="selectShow">
        <div class="muti-select_option" ref="optionRef">
          <ul
            class="muti-select_option_column"
            v-for="(option, index) in options"
            :key="index"
          >
            <li
              class="muti-select_item"
              :class="{
                'muti-select_item_active': activeIndex[index] == indexs,
              }"
              v-for="(item, indexs) in option"
              :key="indexs"
              @click="onClickOptionItem(item, index, indexs)"
            >
              {{ item.label }}
            </li>
          </ul>
        </div>
        <div class="muti-select_button">
          <span class="muti-select_button_item" @click="onSureChoose"
            >确定</span
          >
          <span class="muti-select_button_item" @click="onCloseSelect"
            >取消</span
          >
        </div>
      </div>
    </transition>
  </div>
</template>
<script lang='ts'>
import { Vue, Component, Prop, Model, Emit } from "vue-property-decorator";
@Component({
  name: "multi-select",
})
export default class SuperMultiSelect extends Vue {
  private selectShow: boolean = false;
  private activeIndex: number[] = [];
  private activeColumnIndex: number = -1;
  private saveChooseOption: any[] = [];

  @Model("input", {
    type: Array,
    default: () => [],
  })
  value!: any[];

  @Prop({ default: [], required: true })
  options!: any;

  @Prop()
  placeholder?: string;

  @Prop({ default: false })
  disabled?: boolean;

  mounted() {
    for (let i = 0; i < this.options.length; i++) {
      this.saveChooseOption.push(this.options[i][0].label);
      this.activeIndex.push(0);
    }
    document.addEventListener("click", this.onToggleMain);
  }

  destory() {
    document.removeEventListener("click", this.onToggleMain);
  }

  private get currentValue() {
    return this.value;
  }

  private set currentValue(newValue) {
    this.$emit("input", newValue);
  }

  private get isEmptyValue(): boolean {
    return !(this.currentValue.length > 0);
  }

  private get countValue(): string {
    return this.value.join("-");
  }

  private onOpenSelect() {
    !this.disabled && (this.selectShow = !this.selectShow);
  }

  private onCloseSelect() {
    this.selectShow = false;
  }

  private onSureChoose() {
    this.currentValue = JSON.parse(JSON.stringify(this.saveChooseOption));
    this.onCloseSelect();
  }

  private onToggleMain(e) {
    let selectMain: any = this.$refs.selectMain;
    if (
      !this.$el ||
      this.$el.contains(e.target) ||
      !selectMain ||
      selectMain.contains(e.target)
    ) {
      return false;
    } else {
      this.selectShow = false;
    }
  }

  private onClickOptionItem(item, optionIndex, index) {
    this.$set(this.saveChooseOption, optionIndex, item.label);
    this.$set(this.activeIndex, optionIndex, index);
    this.activeColumnIndex = optionIndex;
    if (this.activeColumnIndex == this.options.length - 1) {
      this.onSureChoose();
    }
  }
}
</script>
<style lang="stylus">
.muti-select {
  position: relative;
  color: #5c5c5c;

  ::-webkit-scrollbar {
    z-index: 11;
    width: 6px;

    &:horizontal {
      height: 6px;
    }

    &-thumb {
      border-radius: 5px;
      width: 6px;
      background: #ccc;
    }

    &-corner {
      background: #fff;
    }

    &-track {
      background: #fff;

      &-piece {
        background: #fff;
        width: 6px;
      }
    }
  }

  .muti-select_main {
    width: 200px;
    line-height: 28px;
    padding: 0 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 12px;
    color: #5c5c5c;
    box-sizing: border-box;
    cursor: pointer;
    transition: all 0.3s;
    position: relative;

    &:hover {
      border-color: #1fb19e;
      transition: all 0.3s;
    }

    .muti-select_placeholder {
      color: #999999;
    }

    .muti-select_icon {
      position: absolute;
      right: 8px;
      top: 3px;
      color: #ccc;
      transition: all 0.3s;
      width: 20px;
    }

    .muti-select_icon_top {
      transform: rotate(-180deg);
      transition: all 0.3s;
    }
  }

  .muti-select_main_focus {
    border: 1px solid #1fb19e;
  }

  .muti-select_body {
    position: relative;
    width: 300px;

    .muti-select_option {
      padding: 30px 0 5px 0;
      border: 1px solid #ebeaed;
      margin-top: 3px;
      border-radius: 3px;
      display: flex;
      position: absolute;
      background-color: #fff;
      width: 300px;

      .muti-select_option_column {
        max-height: 205px;
        overflow-y: auto;
        flex: 1;

        &:not(:last-child) {
          .muti-select_item {
            border-right: 1px solid #f7f7f7;
          }
        }

        .muti-select_item {
          line-height: 34px;
          font-size: 12px;
          padding: 0px 20px;

          &:hover {
            background-color: #e9f7f5;
            cursor: pointer;
          }
        }

        .muti-select_item_active {
          background-color: #e9f7f5;
        }
      }
    }

    .muti-select_button {
      height: 30px;
      position: absolute;
      top: 4px;
      display: flex;
      justify-content: flex-end;
      width: 100%;
      border-bottom: 1px solid #ebeaed;
      line-height: 30px;

      .muti-select_button_item {
        display: inline-block;
        width: 50px;
        background-color: #f7f7f7;
        margin-left: 10px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s;
        font-size: 12px;

        &:hover {
          color: #fff;
          background-color: #1fb19e;
          transition: all 0.3s;
        }
      }
    }
  }
}

.muti-select_main_disabled {
  border: 1px solid #f3f3f3 !important;
  color: #cccccc;

  &:hover {
    border-color: #f3f3f3 !important;
  }
}

.el-zoom-in-top-enter-active, .el-zoom-in-top-leave-active {
  opacity: 1;
  transform: scaleY(1);
  transition: transform 300ms cubic-bezier(0.23, 1, 0.32, 1), opacity 300ms cubic-bezier(0.23, 1, 0.32, 1);
  transform-origin: center top;
}

.el-zoom-in-top-enter, .el-zoom-in-top-leave-active {
  opacity: 0;
  transform: scaleY(0);
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
}

/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
  display: block;
}

body {
  line-height: 1;
}

ol, ul {
  list-style: none;
}

blockquote, q {
  quotes: none;
}

blockquote:before, blockquote:after, q:before, q:after {
  content: '';
  content: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}
</style>