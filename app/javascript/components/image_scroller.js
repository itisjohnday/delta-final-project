import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import great from 'images/happy_face'
import soso from 'images/bad_face'
import okok from 'images/ok_face'
import ImageDisplay from 'image_display'
import TableDisplay from 'table_display'
import 'src/image_scroller.css'
// import { Redirect, BrowserRouter as Router} from 'react-router-dom'



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
fetch('/get_links', {
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

noMore() {
  window.location.href = '/no_entries'
}

sendResult(pts) {
  // console.log(JSON.stringify({entry: this.state.links[0].entry_id, vote: pts}))
  fetch('/vote_reg', {
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
  this.state.links.shift()
  // console.log(this.state.links)
  this.setState({links: this.state.links})
  if (this.state.links.length == 0) {
    this.noMore()
  }
}



  render () {
    console.log(this.props)
    let setImage;
    if (this.state.links.length > 0) {
      setImage = this.state.links[0].link;
    }
    return (

      <div className="container" id="hotornot">
         <div className="row justify-content-lg-center">
          <div className="col-sm-6" >
            <div className="card" style={{border: 'none'}}>
              <ImageDisplay image={setImage}/>
              <div className="rating row card-body justify-content-center">
                <div id="soso" className="col-sm-2">
                  <img onClick={(e)=> {this.handleButton(e, 0)}} src={soso} />
                  <div id="soso_text" className="tooltip">meh</div>
                </div>
                <div id="okok" className="col-sm-2">
                  <img  onClick={(e)=> {this.handleButton(e, 3)}}  src={okok} />
                  <div id="okok_text" className="tooltip">It's OK</div>
                </div>
                <div id="great" className="col-sm-2">
                  <img onClick={(e)=> {this.handleButton(e, 5)}}  src={great} />
                  <div id="great_text" className="tooltip">5 out of 5</div>
                </div>
              </div>
            </div>
          </div>
          <div className="col-sm-4" id="scores">
             <TableDisplay tournament_id={this.props.tournament_id} />
          </div>
      </div>


        

    </div>

    );
  }
}

ImageScroller.propTypes = {
  images: PropTypes.array,
  auth: PropTypes.string,
  tournament_id: PropTypes.number
};

export default ImageScroller
