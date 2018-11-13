import React, { Component } from 'react'
import Header from './Header'

class Edit extends Component {
    render() {
        return (
            <React.Fragment>
                <Header isHidden={false} path={'/manage'} />
                {/* Add Form */}
            </React.Fragment>
        )
    }
}

export default Edit
