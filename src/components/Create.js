import React, { Component } from 'react'
import Header from './Header'

class Create extends Component {
    render() {
        return (
            <React.Fragment>
                <Header isHidden={false} path={'/'} />
                {/* Add Form */}
            </React.Fragment>
        )
    }
}

export default Create
