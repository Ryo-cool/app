export const state = () => ({
  loggedIn: true,

  styles: {
    beforeLogin: {
      appBarHeight: 56
    }
  }
})

export const getters = {}

export const mutations = {
  // ログイン
  setLoggedIn (state, payload) {
    state.loggedIn = payload
  }

}

export const actions = {
  // ログイン
  login ({ commit }) {
    commit('setLoggedIn', true)
  },
  // ログアウト
  logout ({ commit }) {
    commit('setLoggedIn', false)
  }
}