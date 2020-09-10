<template>
  <v-text-field
    v-model="setName"
    :counter="max"
    :rules="rules"
    label="ユーザー名を入力"
    placeholder="あなたの表示名"
    outlined
  />
</template>

<script>
export default {
  // 親からのデータ受け取り(v-model)
  props: {
    name: {
      type: String,
      default: ''
    }
  },
  // バリデーションはここで設定
  data () {
    const max = 30
    return {
      max,
      rules: [
        v => !!v || '',
        v => (!!v && max >= v.length) || `${max}文字以内で入力してください`
      ]
    }
  },
  // 親からのデータをgetで返し、setで編集
  computed: {
    setName: {
      get () { return this.name },
      set (newVal) { return this.$emit('update:name', newVal) }
    }
  }
}
</script>