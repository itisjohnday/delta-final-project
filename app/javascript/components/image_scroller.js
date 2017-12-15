import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import great from 'images/happy_face'
import soso from 'images/bad_face'
import okok from 'images/ok_face'
import ImageDisplay from 'image_display'


class ImageScroller extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      links: this.props.images
    }
  }

add_links(array_links) {
  console.log(array_links)
  this.setState({links: array_links})
}

getMore() {
fetch('http://localhost:3000/get_links', {
  headers: {
    'Content-Type': 'application/json'
  },
  method: 'get' 
}).then((response) => {
  return response.json();
}).then((json) => {
  this.add_links(json);
})
}

handleButton(event, pts) {
  console.log(pts)
  event.preventDefault()
  this.setState({links: this.state.links.slice(1)})
  if (this.state.links.length == 2) {
    this.getMore()
  }
  if (this.state.links.length == 0){
    
  }
  
}


  render () {
    // const display_image = this.state.links[0].link;
    // console.log(this.state.links)
    const setImage = this.state.links[0].link;
    return (
      <div className="container-fluid">
        <div className="row justify-content-lg-center">
          <div className="card" style={{width: 40 + 'em', border: 'none'}}>
              <ImageDisplay image={setImage} />
              <div className="row justify-content-lg-around">
                <button className="btn" style={{background: 'white'}} onClick={(e)=> {this.handleButton(e, 0)}}><img className="col-lg-12" src={soso} /></button>
                <button className="btn" style={{background: 'white'}} onClick={(e)=> {this.handleButton(e ,3)}}><img className="col-lg-12" src={okok} /></button>
                <button className="btn" style={{background: 'white'}} onClick={(e)=> {this.handleButton(e ,5)}}><img className="col-lg-12" src={great} /></button>
              </div>
          </div>
        </div>
      </div>
    );
  }
}

ImageScroller.propTypes = {
  images: PropTypes.array
};

export default ImageScroller
