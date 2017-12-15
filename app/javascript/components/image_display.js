import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"

class ImageDisplay extends React.Component {


  render () {
    return (
      <div >
        <img className="card-img-top" src={this.props.image} />
      </div>
    );
  }
}


export default ImageDisplay
