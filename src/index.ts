import SuperMultiSelect from "@/components/SuperMultiSelect.vue";

const components = [
    SuperMultiSelect
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