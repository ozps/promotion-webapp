import React, { Component } from 'react'
import Header from './Header'

class Create extends Component {
    constructor(props) {
        super(props)
        this.state = {
            promotion: [{ default: 0 }],
            name: '',
            desc: '',
            type: '',
            reward_item: '0',
            reward_percent: '0',
            gift_name: '0',
            gift_weight: '0',
            gift_stock: '0'
        }
    }

    sendCreate = e => {
        e.preventDefault()
        this.props.history.push('/')
        // Post to server & Redirect
    }
    render() {
        return (
            <React.Fragment>
                <Header isHidden={false} path={'/'} />
                <h1 className="form-title">Create Promotion</h1>
                <form className="form-container">
                    <div className="form-group">
                        <label>
                            <strong>Store</strong>
                        </label>
                        <select
                            className="form-control"
                            style={{ maxWidth: 600 }}
                        >
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                        </select>
                    </div>
                    <div className="form-group">
                        <label>
                            <strong>Promotion Name</strong>
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            placeholder="Name"
                            style={{ maxWidth: 600 }}
                            onChange={e => {
                                this.setState({ name: e.target.value })
                            }}
                        />
                    </div>
                    <div className="form-group">
                        <label>
                            <strong>Promotion Description</strong>
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            placeholder="Description"
                            style={{ maxWidth: 600 }}
                            onChange={e => {
                                this.setState({ desc: e.target.value })
                            }}
                        />
                    </div>
                    <div className="form-check form-check-inline">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            value="Reward"
                            onClick={() => this.setState({ type: 'Reward' })}
                        />
                        <label className="form-check-label">
                            <strong>Reward/Discount</strong>
                        </label>
                    </div>
                    <div className="form-check form-check-inline">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            value="Gift"
                            onClick={() => this.setState({ type: 'Gift' })}
                        />
                        <label className="form-check-label">
                            <strong>Gift</strong>
                        </label>
                    </div>
                    <div className="form-group form-check">
                        {this.state.type === 'Reward' && (
                            <div className="form-group form-sub">
                                <div className="form-group">
                                    <label>
                                        <strong>Item Discount</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Item"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                reward_item: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Percent Discount</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Discount"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                reward_percent: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                            </div>
                        )}
                        {this.state.type === 'Gift' && (
                            <div className="form-group form-sub">
                                <div className="form-group">
                                    <label>
                                        <strong>Gift Name</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Name"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                gift_name: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Weight</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Weight"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                gift_weight: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Stock</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Stock"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                gift_stock: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                            </div>
                        )}
                    </div>
                    <button
                        type="submit"
                        className="btn btn-primary"
                        onClick={e => {
                            this.sendCreate(e)
                        }}
                    >
                        Submit
                    </button>
                </form>
            </React.Fragment>
        )
    }
}

export default Create
