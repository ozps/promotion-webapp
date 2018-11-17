import React, { Component } from 'react'

class Login extends Component {
    constructor(props) {
        localStorage.checkSession = '0'
        super(props)
        this.state = {
            user: '',
            pass: ''
        }
    }
    // ปุ่ม form ส่งให้ server check sqlที่ inject ได้
    // ตอบกลับok ก้อเช็ตเปน '1' ถ้าไม่ก้อ redirect '/'
    sendLogin = async e => {
        e.preventDefault()
        if (this.state.user !== '' && this.state.pass !== '') {
            const response = await fetch('/api/check_login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(this.state)
            })
            const results = await response.json()
            // console.log(results)
            if (results.Status === 1) {
                localStorage.checkSession = '1'
                this.props.history.push('/main')
            } else {
                localStorage.checkSession = '0'
                this.props.history.push('/')
            }
        }
    }
    render() {
        return (
            <React.Fragment>
                <center>
                    <form className="form-container" id="form-login">
                        <div className="form-group">
                            <label style={{ marginRight: 320 }}>
                                <strong>Username</strong>
                            </label>
                            <input
                                type="text"
                                className="form-control"
                                placeholder="Username"
                                style={{ maxWidth: 400 }}
                                onChange={e => {
                                    this.setState({ user: e.target.value })
                                }}
                            />
                        </div>
                        <div className="form-group">
                            <label style={{ marginRight: 320 }}>
                                <strong>Password</strong>
                            </label>
                            <input
                                type="password"
                                className="form-control"
                                placeholder="Password"
                                style={{ maxWidth: 400 }}
                                onChange={e => {
                                    this.setState({ pass: e.target.value })
                                }}
                            />
                        </div>
                        <button
                            type="submit"
                            className="btn btn-primary"
                            onClick={e => {
                                this.sendLogin(e)
                            }}
                        >
                            Login
                        </button>
                    </form>
                </center>
            </React.Fragment>
        )
    }
}

export default Login
