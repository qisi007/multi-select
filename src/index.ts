import MultiSelect from "@/components/MultiSelect.vue";

const components = [
    MultiSelect
]

const install = ( Vue: any ) => {
    components.forEach( el => {
        Vue.component(el.name, el);
    })
}

export default {
    install,
    ...components
};