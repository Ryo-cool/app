<template>
  <v-conrainer>
    <v-row justify="center">
      <v-col
        cols="10"
        sm="12"
      >
        <v-card>
          <h2>レビューを書く</h2>
          <v-row>
            <v-col cols="4">
              <v-text-field
                label="タイトル"
              >
              </v-text-field>
              <v-textarea
                label="感想文"
              >
              </v-textarea>
              <v-card-text>
                総合評価（５点満点）
                <v-rating
                  v-model="rating"
                  color="yellow darken-3"
                  background-color="yellow darken-3"
                  empty-icon="mdi-gift-outline"
                  full-icon="mdi-gift"
                  hover
                  large
                ></v-rating>
              </v-card-text>
            </v-col>
          </v-row>
        </v-card>
      </v-col>
    </v-row>
    <v-row justify="center">
      <v-card>
        <v-card-title>
          行った時期
        </v-card-title>
        <v-date-picker
          v-model="picker"
          type="month"
          color="green lighten-1"
          locale="ja"
        ></v-date-picker>
      </v-card>
    </v-row>
    <v-row>
      <v-col>
        <v-btn color="primary">
          投稿する
        </v-btn>
      </v-col>
    </v-row>
  </v-conrainer>

</template>

<script>
import axios from '~/plugins/axios'

export default {
  data() {
    return {
      picker: new Date().toISOString().substr(0, 7),
    }
  }
}

</script>