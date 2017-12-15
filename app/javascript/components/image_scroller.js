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

getMore() {
  fetch('http://localhost:3001/api/articles', {
  headers: {
    'Content-Type': 'application/json'
  },
  method: 'get',
  body: JSON.stringify(articleObject) 
}).then((response) => {
  return response.json();
}).then((json) => {
  console.log(json);
})

}

handleButton(event, pts) {
  console.log(pts)
  event.preventDefault()
  this.setState({links: this.state.links.slice(1)})
  if (this.state.links.length == 0) {
    getMore()
  }
  
}


  render () {
    // const display_image = this.state.links[0].link;
    console.log(this.state.links)
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
