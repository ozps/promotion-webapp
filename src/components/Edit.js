import React, { Component } from 'react'
import Header from './Header'

class Edit extends Component {
    constructor(props) {
        super(props)
        this.state = {
            id: -1,
            name: '',
            desc: ''
        }
    }
    sendEdit = () => {
        // Post to server & Redirect
    }
    render() {
        return (
            <React.Fragment>
                <Header isHidden={false} path={'/manage'} />
                <h1 className="form-title">Edit Promotion</h1>
                <form class="form-container">
                    <div className="form-group">
                        <label>
                            <strong>Store ID</strong>
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            style={{ maxWidth: 600 }}
                            placeholder="ID"
                        />
                    </div>
                    <div className="form-group">
                        <label>
                            <strong>Store Name</strong>
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            style={{ maxWidth: 600 }}
                            placeholder="Name"
                        />
                    </div>
                    <div className="form-group">
                        <label>
                            <strong>Promotion</strong>
                        </label>
                        <textarea
                            className="form-control"
                            style={{ maxWidth: 600 }}
                            rows="3"
                        />
                    </div>
                    <button
                        type="submit"
                        className="btn btn-primary"
                        onClick={this.sendEdit()}
                    >
                        Submit
                    </button>
                </form>
            </React.Fragment>
        )
    }
}

export default Edit
