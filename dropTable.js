require('dotenv').config()
const { Pool } = require('pg')

async function main() {
  const dropTables = async () => {
    const pool = new Pool()

    const queryTableNames = await pool.query(
      `select table_name from information_schema.tables 
        WHERE table_schema='public' AND table_type='BASE TABLE'`
    )

    if (!queryTableNames.rowCount) return 'not any table'
    const tableNames = queryTableNames.rows
      .map((table) => table.table_name)
      .join(', ')

    await pool.query(`drop table ${tableNames}`)

    await pool.end()
    return tableNames
  }

  const tableNames = await dropTables()
  console.log('drop tables: ', tableNames)
}

main()
