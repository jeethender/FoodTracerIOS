
import UIKit

class RatingControl: UIView {
    //MARK: Properties
    
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    //MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for _ in 0..<5 {
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted,.Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        var buttonFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        // Offset each button's origin by lenght of the button plus spacing
        
        for(index,button) in ratingButtons.enumerate()
        {
            buttonFrame.origin.x = CGFloat(index * ( 44 + 5))
            button.frame = buttonFrame
        }
       updateButtonSelectionState()
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    //MARK: Button Action
    
    func ratingButtonTapped(button:UIButton)
    {
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionState()
     }
    
    func updateButtonSelectionState(){
        
        for(index,button) in ratingButtons.enumerate(){
        //If index of the button is less than the rating that button should be selected.
         button.selected = index < rating
        }
    }
}
