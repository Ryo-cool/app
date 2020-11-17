<template>
  <div>
    <v-autocomplete
        v-model="model"
        :items="items"
        :search-input.sync="search"
        color="primary"
        item-text="name"
        cache-items
        hide-no-data
        hide-selected
        placeholder="入力できます"
        prepend-icon="mdi-database-search"
        return-object
        clearable
    ></v-autocomplete>
  </div>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data (){
    return {
      items:[],
      model: "",
      search: "",
    }
  },
  watch: {
    search(val) {
      // すでに読み込み済みの場合は、何もしない
      if (this.items.length > 0) return
      // 読み込み中の場合も、何もしない
      if (this.isLoading) return

      

      // APIから、選択肢をfetchする
      axios.get("/api/v1/spots").then(res => {
        this.items = res.data
      }).catch(err => {
          console.log(err)
      //読み込みが完了したので、loadingをfalseに
      })
    }
  }
}
</script>