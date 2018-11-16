import React, { Component } from 'react'
import Header from './Header'

class Edit extends Component {
    constructor(props) {
        super(props)
        this.state = {
            ID: -1,
            name: '',
            desc: '',
            type: '',
            new_type: '',
            discount_item: '',
            discount_percent: '',
            gift_name: '',
            gift_type: '',
            gift_weight: '',
            gift_stock: ''
        }
    }
    componentDidMount() {
        this.getPro()
    }
    deleteAll = async () => {
        const response = await fetch('/api/delete_promotion_type', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ proID: this.state.ID })
        })
    }
    editPro = async () => {
        const response = await fetch('/api/edit_promotion', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                proID: this.state.ID,
                name: this.state.name,
                desc: this.state.desc,
                type: this.state.new_type
            })
        })
    }
    editGift = async () => {
        const response = await fetch('/api/edit_gift', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                proID: this.state.ID,
                name: this.state.gift_name,
                type: this.state.gift_type,
                weight: this.state.weight_name,
                stock: this.state.gift_stock
            })
        })
    }
    editDiscount = async () => {
        const response = await fetch('/api/edit_discount', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                proID: this.state.ID,
                itemm: this.state.discount_item,
                percent: this.state.discount_percent
            })
        })
    }
    addDetail = async () => {
        const response = await fetch('/api/add_detail', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(this.state)
        })
    }
    sendEdit = e => {
        e.preventDefault()
        this.editPro()
        if (this.state.type !== this.state.new_type) {
            this.deleteAll()
            this.addDetail()
        } else {
            if (this.state.new_type === 'Gift') this.editGift()
            else if (this.state.new_type === 'Discount') this.editDiscount()
        }
        this.props.history.push('/manage')
    }
    getPro = async () => {
        const response = await fetch('/api/get_promotion', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ proID: localStorage.editProID })
        })
        const results = await response.json()
        for (var k in results) {
            if (!results[k]) results[k] = ''
        }
        await this.setState({
            ID: results['PromotionID'],
            name: results['PromotionName'],
            desc: results['PromotionDesc'],
            type: results['PromotionType'],
            new_type: results['PromotionType'],
            discount_item: results['ItemDiscount'],
            discount_percent: results['PercentDiscount'],
            gift_name: results['GiftName'],
            gift_type: results['GiftType'],
            gift_weight: results['Weight'],
            gift_stock: results['Stock']
        })
    }
    render() {
        return (
            <React.Fragment>
                <Header isHidden={false} path={'/'} />
                <h1 className="form-title">Edit Promotion</h1>
                <form className="form-container">
                    <div className="form-group">
                        <label>
                            <h2>
                                {`Store : ${
                                    this.props.location.state.storeName
                                }`}
                            </h2>
                        </label>
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
                            placeholder={
                                this.props.location.state.promotionName
                            }
                            onChange={e => {
                                this.setState({ storeName: e.target.value })
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
                            placeholder={
                                this.props.location.state.promotionDesc
                            }
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
                            value="Discount"
                            checked={this.state.new_type === 'Discount'}
                            onChange={() =>
                                this.setState({ new_type: 'Discount' })
                            }
                        />
                        <label className="form-check-label">
                            <strong>Discount</strong>
                        </label>
                    </div>
                    <div className="form-check form-check-inline">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            value="Gift"
                            checked={this.state.new_type === 'Gift'}
                            onChange={() => this.setState({ new_type: 'Gift' })}
                        />
                        <label className="form-check-label">
                            <strong>Gift</strong>
                        </label>
                    </div>
                    <div className="form-check form-check-inline">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            value="None"
                            checked={this.state.new_type === ''}
                            onChange={() => this.setState({ new_type: '' })}
                        />
                        <label className="form-check-label">
                            <strong>None</strong>
                        </label>
                    </div>
                    <div className="form-group form-check">
                        {this.state.new_type === 'Discount' && (
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
                                        value={this.state.discount_item}
                                        onChange={e => {
                                            this.setState({
                                                discount_item: e.target.value
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
                                        value={this.state.discount_percent}
                                        onChange={e => {
                                            this.setState({
                                                discount_percent: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                            </div>
                        )}
                        {this.state.new_type === 'Gift' && (
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
                                        value={this.state.gift_name}
                                        onChange={e => {
                                            this.setState({
                                                gift_name: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Type</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Type"
                                        style={{ maxWidth: 300 }}
                                        value={this.state.gift_type}
                                        onChange={e => {
                                            this.setState({
                                                gift_type: e.target.value
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
                                        value={this.state.gift_weight}
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
                                        value={this.state.gift_stock}
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
                        onClick={e => this.sendEdit(e)}
                    >
                        Submit
                    </button>
                </form>
            </React.Fragment>
        )
    }
}

export default Edit
