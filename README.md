## Scripts

In the project directory, you can run:

### `npm run dev`

To start Promotion-Webapp

You must install:
MAMP or other local web servers.

You need to :

1.  create mySQL Database using dbproject.sql in config folder.
2.  create user who can access database.
3.  create Table User which consist of record admin username and password.
    Example

    <table>
        <tr>
            <th>username</th>
            <th>password</th> 
        </tr>
        <tr>
            <td>admin</td>
            <td>xxxx</td> 
        </tr>
    </table>

4.  create dbconnect.js in config folder.
    Example
    module.exports = {
    host: 'localhost',
    user: 'username',
    pass: 'password',
    database: 'dbname',
    port: '8889'
    }
