<template>
  <v-text-field
    v-model="setMail"
    label="メールアドレスを入力"
    placeholder="your@email.com"
    outlined
  />
</template>

<script>
export default {
  props: {
    email: {
      type: String,
      default: ''
    }
  },
  computed: {
    setMail: {
      get () { return this.email },
      set (newVal) { return this.$emit('update:email', newVal) }
    }
  }
}
</script>