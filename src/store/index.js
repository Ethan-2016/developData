/*
 * @Autor: Linbaochang
 * @Date: 2020-12-17 16:27:53
 * @LastEditors: Linbaochang
 * @LastEditTime: 2021-05-21 18:08:24
 */
import Vue from 'vue';
import Vuex from 'vuex';
import VuexPersistence from 'vuex-persist';

import getters from './getters';
import app from './modules/app';
import sys from './modules/sys';
import device from './modules/device';
import workbench from './modules/workbench';
import cdss from './modules/cdss';
import patientCanula from './modules/patientCanula';
import patientSkin from './modules/patientSkin';
import reportCommon from './modules/reportCommon';

Vue.use(Vuex);

let persis = new VuexPersistence({
  storage: window.localStorage,
});
let store = new Vuex.Store({
  modules: {
    app: app,
    sys: sys,
    device: device,
    workbench: workbench,
    reportCommon: reportCommon,
    cdss: cdss,
    patientCanula: patientCanula,
    patientSkin: patientSkin,
  },
  getters: getters,
  plugins: [persis.plugin],
});

export default store;
