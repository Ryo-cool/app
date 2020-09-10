<template>
  <v-text-field
    v-model="setMail"
    :rules="rules"
    label="メールアドレスを入力"
    placeholder="form.placeholder"
    outlined
  />
</template>

<script>
export default {
  props: {
    email: {
      type: String,
      default: ''
    },
    noValidation: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      rules: [
        v => !!v || '',
        // 正規表現のメールチェック
        v => /.+@.+\..+/.test(v) || ''
      ]
    }
  },
  computed: {
    setMail: {
      get () { return this.email },
      set (newVal) { return this.$emit('update:email', newVal) }
    },
    form () {
      const placeholder = this.noValidation ? undefined : 'your@email.com'
      return { placeholder }
    }
  }
}
</script>