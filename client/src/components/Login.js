import React, { Component } from 'react'
import { Helmet } from 'react-helmet'
import Header from './Header'

class Login extends Component {
    constructor(props) {
        localStorage.checkSession = '0'
        super(props)
        this.state = {
            user: '',
            pass: ''
        }
    }
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
            <React.Fragment className="bg-secondary">
                <Helmet
                    bodyAttributes={{ style: 'background-color : #778899' }}
                />
                <Header isHidden={true} />
                <center>
                    <h1 style={{ margin: 50 }}>
                        <span class="badge badge-dark">Promotion WebApp</span>
                    </h1>
                    <form id="form-main" style={{ maxWidth: 400 }}>
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
                            className="btn btn-outline-primary"
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
