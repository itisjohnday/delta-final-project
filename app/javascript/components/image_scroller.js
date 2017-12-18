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
      links: this.props.images,
      token: this.props.auth
    }
  }

add_links(array_links) {
  // console.log(array_links)
  this.setState({links: array_links})
}

getMore() {
fetch('http://localhost:3000/get_links', {
  headers: {
    'Content-Type': 'application/json',
  },
  method: 'get' 
}).then((response) => {
  return response.json();
}).then((json) => {
  this.add_links(json);
})
}

sendResult(pts) {
  // console.log(JSON.stringify({entry: this.state.links[0].entry_id, vote: pts}))
  fetch('http://localhost:3000/vote_reg', {
    method: 'POST',
    credentials: 'include',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': this.state.token
    },
    body: JSON.stringify({entry: this.state.links[0].entry_id, vote: pts})
}).then((response) => {
  console.log(response);
})

}

handleButton(event, pts) {
  // console.log(pts)
  event.preventDefault()
  this.sendResult(pts)
  this.setState({links: this.state.links.slice(1)})
  if (this.state.links.length == 2) {
    this.getMore()
  }

}


  render () {
    
    const display_image = this.state.links[0].link;
    const token = document.querySelector('meta[name="csrf-token"]').content;
    // console.log(this.props.auth.toString())
    console.log(token)
    const setImage = this.state.links[0].link;
    return (
      <div className="container-fluid">
        <div className="row justify-content-lg-center">
          <div className="card" style={{width: 40 + 'em', border: 'none'}}>
              <ImageDisplay image={setImage} />
              <div className="row justify-content-lg-around">
                <img onClick={(e)=> {this.handleButton(e, 0)}} className="face" src={soso} />
                <img onClick={(e)=> {this.handleButton(e, 3)}} className="face" src={okok} />
                <img onClick={(e)=> {this.handleButton(e, 5)}} className="face" src={great} />
              </div>
          </div>
        </div>
      </div>
    );
  }
}

ImageScroller.propTypes = {
  images: PropTypes.array,
  auth: PropTypes.string
};

export default ImageScroller
