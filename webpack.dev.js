/**
 * Конфигурация webpack для локальной разработки.
 */

const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const CircularDependencyPlugin = require('circular-dependency-plugin');

module.exports = require('./webpack.base')({
  mode: 'development',
  entry: [
    require.resolve('react-app-polyfill/ie11'),
    path.join(process.cwd(), 'src/index.js'),
  ],
  output: {
    filename: '[name].js',
    chunkFilename: '[name].chunk.js',
  },
  optimization: {
    splitChunks: {
      chunks: 'all',
    },
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new HtmlWebpackPlugin({
      inject: true,
      template: 'src/index.html',
    }),
    new CircularDependencyPlugin({
      exclude: /a\.js|node_modules/, // exclude node_modules
      failOnError: false, // show a warning when there is a circular dependency
    }),
  ],
  devtool: 'eval-source-map',
  performance: {
    hints: false,
  },
  devServer: {
    contentBase: path.join(__dirname, 'build'),
    port: 3000,
  }
});
