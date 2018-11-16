import React from 'react'

const Header = ({ isHidden, path }) => {
    return (
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
            <a className="navbar-brand" href="/">
                <strong>Half Night Miracle</strong>
            </a>
            <span className="navbar-nav mr-auto" />
            {!isHidden && (
                <a
                    href={path}
                    className="btn btn-secondary btn-lg active btn-sm"
                    role="button"
                    aria-pressed="true"
                >
                    Back
                </a>
            )}
        </nav>
    )
}

export default Header
