const path = require('path')
const webpack = require('webpack')
const HappyPack = require('happypack')
const LiveReloadPlugin = require('webpack-livereload-plugin')

const fileLoader = {
  loader: 'file-loader', options: {
    name(file) {
      const p = path.parse(file)
      return p.dir.replace(/.*\/src/, 'game') + '/[name].[ext]'
    }
  }
}

module.exports = {
  devtool: 'inline-cheap-source-map',
  entry: {
    main: './src/index.coffee',
    eventDump: './src/eventDump.coffee',
    eventGraph: './src/eventGraph.coffee',
  },
  mode: 'development',
  module: {
    rules: [
      {
        test: /\.coffee$/,
        use: 'happypack/loader',
      },
      {
        test: /\.(png|jpg|gif|svg|html)$/,
        use: fileLoader,
      },
      {
        test: /\.css$/,
        use: [{ loader: 'style-loader/url' }, fileLoader],
      },
    ]
  },
  performance: {
    hints: false,
  },
  plugins:[
    new HappyPack({
      loaders: ['coffee-loader'],
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
    extensions: ['.coffee', '.js', '.json']
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
