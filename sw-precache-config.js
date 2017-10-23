/*
@author Aurélien Hébert (aurrelhebert)
@copyright (c) 2017 Cityzen Data
@license Apache 2.0
*/

/* eslint-env node */

module.exports = {
  staticFileGlobs: [
    '/index.html',
    '/manifest.json',
    '/bower_components/webcomponentsjs/*',
  ],
  navigateFallback: 'index.html',
  navigateFallbackWhitelist: [/^(?!.*\.html$|\/data\/).*/],
};
