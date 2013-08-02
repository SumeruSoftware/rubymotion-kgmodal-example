class RootController < UIViewController
  def viewDidLoad
    super
    view.backgroundColor = UIColor.whiteColor
    showButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    showButton.frame = [[50,150], [200, 62]]
    showButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin
    showButton.setTitle("Show Modal", forState:UIControlStateNormal)
    showButton.addTarget(self, action:'showAction', forControlEvents:UIControlEventTouchUpInside)
    view.addSubview(showButton)
  end

  def showAction
    contentView = UIView.alloc.initWithFrame([[0, 0,], [280, 200]])

    welcomeLabelRect = contentView.bounds;
    welcomeLabelRect.origin.y = 20;
    welcomeLabelRect.size.height = 20;
    welcomeLabelFont = UIFont.boldSystemFontOfSize(17)
    welcomeLabel = UILabel.alloc.initWithFrame(welcomeLabelRect)
    welcomeLabel.text = "Welcome to KGModal!"
    welcomeLabel.font = welcomeLabelFont
    welcomeLabel.textColor = UIColor.whiteColor
    welcomeLabel.textAlignment = NSTextAlignmentCenter
    welcomeLabel.backgroundColor = UIColor.clearColor
    welcomeLabel.shadowColor = UIColor.blackColor
    welcomeLabel.shadowOffset = CGSizeMake(0, 1)
    contentView.addSubview(welcomeLabel)

    infoLabelRect = CGRectInset(contentView.bounds, 5, 5)
    infoLabelRect.origin.y = CGRectGetMaxY(welcomeLabelRect)+5
    infoLabelRect.size.height -= CGRectGetMinY(infoLabelRect)

    infoLabel = UILabel.alloc.initWithFrame(infoLabelRect)
    infoLabel.text = "KGModal is an easy drop in control that allows you to display any view "
    "in a modal popup. The modal will automatically scale to fit the content view "
    "and center it on screen with nice animations!"
    infoLabel.numberOfLines = 4
    infoLabel.textColor = UIColor.whiteColor
    infoLabel.textAlignment = NSTextAlignmentCenter
    infoLabel.backgroundColor = UIColor.clearColor
    infoLabel.shadowColor = UIColor.blackColor
    infoLabel.shadowOffset = CGSizeMake(0, 1)
    contentView.addSubview(infoLabel)

    KGModal.sharedInstance.showWithContentView(contentView, andAnimated:true)
  end

end
