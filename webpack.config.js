const path = require('path')
const webpack = require('webpack')

const fileLoader = {
  loader: 'file-loader', options: {
    name(file) {
      const p = path.parse(file)
      return p.dir.replace(/.*\/src/, 'game') + '/[name].[ext]'
    }
  }
}

module.exports = {
  devtool: 'inline-source-map',
  entry: './src/index.js',
  mode: 'production',
  module: {
    rules: [
      {
        test: /\.coffee$/,
        use: [{loader: 'coffee-loader', options: {}}]
      },
      {
        test: /\.(png|jpg|gif|svg|css)$/,
        use: [fileLoader],
      },
    ]
  },
  plugins:[
    new webpack.DefinePlugin({
      ENABLE_CH3: false
    })
  ],
  stats: 'errors-only',
};
