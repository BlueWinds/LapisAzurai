const path = require('path')
const webpack = require('webpack')
const HappyPack = require('happypack')
const LiveReloadPlugin = require('webpack-livereload-plugin')

const fileLoader = {
  loader: 'file-loader', options: {
    name(file) {
      const p = path.parse(file)
      const value = p.dir.replace(/.*\/src/, '') + '/[name].[ext]'
      if (file.match('css')) { return value.replace(/^\//, '') }
      return value
    }
  }
}

module.exports = {
  devtool: 'inline-cheap-source-map',
  entry: {
    main: './src/index.js',
    eventDump: './src/eventDump.js',
    eventGraph: './src/eventGraph.js',
  },
  mode: 'development',
  module: {
    rules: [
      {
        test: /\.js$/,
        use: 'happypack/loader',
      },
      {
        test: /\.(png|jpg|gif|html|txt)$/,
        use: fileLoader,
      },
      {
        test: /\.svg$/,
        loader: 'svg-inline-loader',
      },
      {
        test: /\.css$/,
        use: [{loader: 'style-loader', options: {injectType: 'linkTag'}}, fileLoader],
      },
    ]
  },
  performance: {
    hints: false,
  },
  plugins:[
    new HappyPack({
      loaders: ['babel-loader'],
      verbose: false,
    }),
    new webpack.DefinePlugin({
      ENABLE_CH3: false
    }),
    new LiveReloadPlugin({}),
  ],
  resolve: {
    alias: {
      content: path.resolve(__dirname, 'src/content/'),
      game: path.resolve(__dirname, 'src/engine/game'),
      gui: path.resolve(__dirname, 'src/engine/gui'),
    },
    extensions: ['.js', '.json']
  },
  stats: {
    assets: false,
    builtAt: false,
    chunks: false,
    entrypoints: false,
    hash: false,
    modules: false,
    version: false,
  },
};
