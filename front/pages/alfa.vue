<template>
  <v-container>
    <v-row>
      <v-col
      cols ="12"
      sm="6"
      class="my-6 text-center"
      align-self="start"
      >
      <user-form-email
      />
      <user-form-password
      />
      </v-col>
      <v-col
      cols ="12"
      sm="6"
      class="my-6 text-center"
      >
      <user-form-password
      />
      </v-col>
      <v-col
        cols="12"
      >
        <v-card-title>
          最近のプロジェクト
        </v-card-title>
        <v-divider class="mb-4" />
        <v-card
          class="pa-4 mb-6"
          flat
          height="350px"
          img="https://cdn.vuetifyjs.com/images/toolbar/map.jpg"
        >
          <v-toolbar
            dense
            floating
          >
            <v-text-field
              hide-details
              prepend-icon="mdi-magnify"
              single-line
            ></v-text-field>

            <v-btn icon>
              <v-icon>mdi-crosshairs-gps</v-icon>
            </v-btn>

            <v-btn icon>
              <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
          </v-toolbar>
        </v-card>
        <v-sheet
          tile
          height="54"
          class="d-flex"
        >
          <v-btn
            icon
            class="ma-2"
            @click="$refs.calendar.prev()"
          >
            <v-icon>mdi-chevron-left</v-icon>
          </v-btn>
          <v-select
            v-model="type"
            :items="types"
            dense
            outlined
            hide-details
            class="ma-2"
            label="type"
          ></v-select>
          <v-select
            v-model="mode"
            :items="modes"
            dense
            outlined
            hide-details
            label="event-overlap-mode"
            class="ma-2"
          ></v-select>
          <v-select
            v-model="weekday"
            :items="weekdays"
            dense
            outlined
            hide-details
            label="weekdays"
            class="ma-2"
          ></v-select>
          <v-spacer></v-spacer>
          <v-btn
            icon
            class="ma-2"
            @click="$refs.calendar.next()"
          >
            <v-icon>mdi-chevron-right</v-icon>
          </v-btn>
        </v-sheet>
        <v-sheet height="600">
          <v-calendar
            ref="calendar"
            v-model="value"
            :weekdays="weekday"
            :type="type"
            :events="events"
            :event-overlap-mode="mode"
            :event-overlap-threshold="30"
            :event-color="getEventColor"
            @change="getEvents"
          ></v-calendar>
        </v-sheet>
      </v-col>
      <v-col 
      cols = "12"
      sm ="6"
      >
        <v-carousel v-model="model" height="350">
          <v-carousel-item
            v-for="(color, i) in colors"
            :key="color"
          >
            <v-sheet
              :color="color"
              height="100%"
              tile
            >
              <v-row
                class="fill-height"
                align="center"
                justify="center"
              >
                <div class="display-3">
                  Slide {{ i + 1 }}
                </div>
              </v-row>
            </v-sheet>
          </v-carousel-item>
        </v-carousel>
      </v-col>
      <v-col 
      cols = "12"
      sm ="6"
      >
        <v-carousel v-model="model" height="350">
          <v-carousel-item
            v-for="(color, i) in colors"
            :key="color"
          >
            <v-sheet
              :color="color"
              height="100%"
              tile
            >
              <v-row
                class="fill-height"
                align="center"
                justify="center"
              >
                <div class="display-3">
                  Slide {{ i + 1 }}
                </div>
              </v-row>
            </v-sheet>
          </v-carousel-item>
        </v-carousel>
      </v-col>
    </v-row>
  </v-container>

</template>


<script>
  export default {
    data () {
      return {
        loader: null,
        loading: false,
        loading2: false,
        loading3: false,
        loading4: false,
        loading5: false,
      model: 0,
      colors: [
        'primary',
        'secondary',
        'yellow darken-2',
        'red',
        'orange',
      ],
      }
    },
    watch: {
      loader () {
        const l = this.loader
        this[l] = !this[l]

        setTimeout(() => (this[l] = false), 3000)

        this.loader = null
      },
    },
  }
</script>

<style>
  .custom-loader {
    animation: loader 1s infinite;
    display: flex;
  }
  @-moz-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-webkit-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-o-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
</style>