<template>
  <v-container>
    <v-row>
      <v-col>
        {{ name }}
        <v-card class="pa-10 mx-auto mt-10" width="50%">
          <v-form>
            <input type="file" @change="setImage"/>
            <v-text-field
              v-model="name" 
              outline 
              placeholder="感想や思い出に残ったことをまとめましょう"/>
            <v-card-actions>
              <v-btn @click="submit">保存</v-btn>
            </v-card-actions>
          </v-form>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "~/plugins/axios"

export default {
  data(){
    return{
      name:"",
      image:null,
      uploadedImage: '',
      // image:[]
    }
  },
  methods:{
    submit(e){
      // var formData = new FormData();
      // formData.append('name', this.name)
      // formData.append('image', this.image)
      // const config = {
      //   headers: {
      //     'content-type': 'multipart/form-data'
      //   }
      // }
      axios.post("/api/v1/spots/",
        {name: this.name}
        // formData,config
      ).then(response => {
        if (res.data){
        this.name = ''
        // this.image = ''
        console.log("success");
        }
        // this.$refs.file.value = ''
        
      }).catch(error => {
        console.log(error);
      })
    },
    setImage(e) {
      this.image = event.files;
    },
  }
}

</script>