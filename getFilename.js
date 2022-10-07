const testFolder = '/home/zidni/Downloads'
const fs = require('fs')

async function main() {
  const fileSub = fs.readdirSync(testFolder).filter(function (file) {
    return file.indexOf('.zip') !== -1
  })[0]

  console.log(fileSub.replace(/\.[^/.]+$/, ''))
}

main()
