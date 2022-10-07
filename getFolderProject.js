const testFolder = '/home/zidni/Downloads/review'
const fs = require('fs')

async function main() {
  const getDirectories = (source) =>
    fs
      .readdirSync(source, { withFileTypes: true })
      .filter((dirent) => dirent.isDirectory())
      .map((dirent) => dirent.name)

  let isProject = false
  let path = '/home/zidni/Downloads/review'

  do {
    const files = fs.readdirSync(path)

    if (files.filter((file) => file === 'package.json')[0]) {
      isProject = true
      console.log(path)
    }

    const folder = getDirectories(path)[0]

    path += `/${folder}`
  } while (!isProject)
}

main()
