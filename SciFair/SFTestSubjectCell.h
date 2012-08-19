//
//  SFTestSubjectCell.h
//  SciFair
//
//  Created by Carlos Arcenas on 8/18/12.
//  Copyright (c) 2012 Carlos Arcenas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFTestSubjectCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *subjectName;
@property (weak, nonatomic) IBOutlet UILabel *subjectGender;
@property (weak, nonatomic) IBOutlet UILabel *subjectPoints;


@end
