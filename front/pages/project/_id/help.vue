<template>
  <v-container>
    <v-row align="center" justify="center">
      <v-col cols="12">
        <v-card
          class="mx-auto"
          max-width="400"
          tile
        >
          <ul class="resultItems">
            <li class="v-list disabled" v-for="item in results" :key="item.id">
              <img :src="item.Item.mediumImageUrls[0].imageUrl" class="imgStyle">
              <dl class="dataStyle">
                <dt>
                  <a :href="item.Item.itemUrl">
                    Name: {{ item.Item.itemName.slice(0,20) + "..." }}
                  </a>
                </dt>
                <dd class="v-subheader">
                  ¥{{ item.Item.itemPrice }}
                </dd>
              </dl>
            </li>
          </ul>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      results: []
    }
  },
  async asyncData({ app }) {
    const baseUrl = 'https://app.rakuten.co.jp/services/api/IchibaItem/Search/20170706?'
    const appId = 'applicationId=1044180210174562479'
    const word = "サツマイモ"
    const keyword = '&keyword=' + word// カービィ以外認めません
    const getUrl = encodeURI(baseUrl + appId + keyword)
    const response = await app.$axios.$get(getUrl)
    return {
      results: response.Items
    }
  }
}
</script>