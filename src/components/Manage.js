import React, { Component } from 'react'
import Header from './Header'

class Manage extends Component {
    constructor(props) {
        super(props)
        this.state = {
            promotion: []
        }
    }
    componentDidMount() {
        // fetchData & setState
    }
    renderPromotion = () => {
        // View results format & Add Edit and Delete
    }
    render() {
        return (
            <React.Fragment>
                <Header isHidden={false} path={'/'} />
                <ul className="list-group">{this.renderPromotion()}</ul>
            </React.Fragment>
        )
    }
}

export default Manage
