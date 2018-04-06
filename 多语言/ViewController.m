//
//  ViewController.m
//  多语言
//
//  Created by coder on 2018/4/6.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "ViewController.h"
#import "SwichLanguage.h"
@interface ViewController ()
@property (nonatomic, strong)UILabel *label;
@property (nonatomic, strong) UIButton *switchLang;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.label];
    
    [self.view addSubview:self.switchLang];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLanguage) name:@"changeLanguage" object:nil];
//    NSArray *preferredLanguages = [NSLocale preferredLanguages];
//    NSString *lan = preferredLanguages[0];
    //初始化应用语言
    [SwichLanguage initUserLanguage];
    NSBundle *bundle = [SwichLanguage bundle];
    NSString *str = [bundle localizedStringForKey:@"label" value:nil table:@"InterNational"];
    self.label.text = str;
    NSString *btnStr = [bundle localizedStringForKey:@"button" value:nil table:@"InterNational"];
    [self.switchLang setTitle:btnStr forState:UIControlStateNormal];
    
}
- (void)changeLanguage {
      self.label.text =[[SwichLanguage bundle] localizedStringForKey:@"label"value:nil table:@"InterNational"];
    [self.switchLang setTitle:[[SwichLanguage bundle] localizedStringForKey:@"button"value:nil table:@"InterNational"] forState:UIControlStateNormal];
}
- (UIButton *)switchLang {
    if (!_switchLang) {
        _switchLang = [UIButton buttonWithType:UIButtonTypeCustom];
        _switchLang.frame = CGRectMake((self.view.bounds.size.width - 200)/2.0, CGRectGetMaxY(self.label.frame) + 100, 200, 40);
        [_switchLang setBackgroundColor:[UIColor greenColor]];
        [_switchLang addTarget:self action:@selector(selectLanguage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _switchLang;
}
- (void)selectLanguage {
    NSString *title = [[SwichLanguage bundle] localizedStringForKey:@"switch_lang"value:nil table:@"InterNational"];
//    NSString *message = @"switch language";
    NSString *simp = [[SwichLanguage bundle] localizedStringForKey:@"chinese"value:nil table:@"InterNational"];
    NSString *eng = [[SwichLanguage bundle] localizedStringForKey:@"english"value:nil table:@"InterNational"];
    NSString *jap = [[SwichLanguage bundle] localizedStringForKey:@"japanese"value:nil table:@"InterNational"];
    NSString *cl = [[SwichLanguage bundle] localizedStringForKey:@"cancel"value:nil table:@"InterNational"];
//    //修改语言
//    NSString *language = [SwichLanguage userLanguage];
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle: title message:@"" preferredStyle:UIAlertControllerStyleAlert];//创建界面
    UIAlertAction *chinese=[UIAlertAction actionWithTitle:simp style:UIAlertActionStyleDefault handler:^(UIAlertAction *acton){
          [SwichLanguage setUserlanguage:@"zh-Hans"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage"object:self];
    }];
    UIAlertAction *english=[UIAlertAction actionWithTitle:eng style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
          [SwichLanguage setUserlanguage:@"en"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage"object:self];
        
    }];
    UIAlertAction *japanese=[UIAlertAction actionWithTitle:jap style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
          [SwichLanguage setUserlanguage:@"ja"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLanguage"object:self];
    }];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:cl style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){}];
    
    //最后将这些按钮都添加到界面上去，显示界面
    [alertController addAction:chinese];
    [alertController addAction:english];
    [alertController addAction:japanese];
    [alertController addAction:cancel];
    [self presentViewController: alertController animated:YES completion:nil];
}
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.bounds.size.width - 40, 30)];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
