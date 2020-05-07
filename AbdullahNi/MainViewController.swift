//
//  ViewController.swift
//  AbdullahNi
//
//  Created by abdullah on 11/09/1441 AH.
//  Copyright © 1441 abdullah. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
      
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet var btns: [UIButton]!
    @IBOutlet weak var count: UILabel!
    
   
    var radius: CGFloat = 20
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        holderView.layer.cornerRadius = radius
        images.layer.cornerRadius = radius
        
        for btn in btns {
            btn.layer.cornerRadius = radius
        }
        setObject(anim: .transitionFlipFromLeft)
    }
    
    func setObject(anim: UIView.AnimationOptions) {
        let fact = SureFacts[currentIndex]
        titleLabel.text = fact.title
        descLabel.text = fact.desc
        images.image = fact.imageFormatted
       
        count.text = String(currentIndex + 1) + "/" + String(SureFacts.count)
        UIView.transition(with: holderView, duration: 0.5, options: anim, animations: nil, completion: nil)
    }
    
    @IBAction func previous(_ sender: Any) {
        if currentIndex == 0 {
            currentIndex = SureFacts.count - 1
        } else {
            currentIndex -= 1
        }
        setObject(anim: .transitionFlipFromRight)
    }
    
    
    @IBAction func random(_ sender: Any) {
        let rand = Int.random(in: 0..<SureFacts.count)
        currentIndex = rand
        setObject(anim: .transitionFlipFromBottom)
    }
    
    @IBAction func next(_ sender: Any) {
        if currentIndex < SureFacts.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        setObject(anim: .transitionFlipFromLeft)
    }
    
    var SureFacts = [
        Fact(title: "مقتل وحيد القرن", image: 1, desc: "صورة مؤلمة لوحيد قرن أسود، مسلوخ القرن، عُثر عليه مقتولاً في محمية هلولوي اومفولزي الطبيعية"),
        Fact(title: "مريض عاش اكثر من طبيبة", image: 2, desc: "في الصوره المريض يحمل صوره التقطت اثناء العمليه للدكتور وزميله الذي صقط مغشياً عليه على السرير بجانبه والتي دامت 23 ساعة متواصله على الرغم من انها معقده ومستحيله الا انها نجحت "),
        Fact(title: "انتظرني يا أبي", image: 3, desc: "هذه الصورة أثناء مسيرة فوج القوات الكندية عبر شوارع مدينة فانكوفر و استطاع المصور ديتلوف لفت الإنتباه إلى الوجه الآخر للحرب  إذ يظهر في الصورة صبي صغير في الخامسة من العمر صارخا بأعلى صوته : انتظرني ياابي  لينجح المصور بتجسيد واحدة من أكثر اللحظات برائة في الحرب"),
        Fact(title: "دورة الألعاب الأولمبية للمعاقين", image: 4, desc: "السباح الاسباني خافيير توريس وهو في طريقة الى تحطيم الرقم القياسي في مسابقة السباحة فردي متنوع 150 متر رجال في الألعاب الأولومبية للمعاقين"),
        Fact(title: "سقوط سلم النجاة", image: 5, desc: " يقول المصور : فجأة إنهار سلم الإنقاذ تحت أقدام الثلاثة.. حدث كل شيء أمام عينيّ هكذا فجأة وبسرعة رهيبة.. كنت مصدوماً في حينها ويداي ترتجفان بعنف.. لكن إصبعي دون وعي مني ظلت تكبس على زرار التصوير بينما كانت الأجساد تسقط من هناك"),
        Fact(title: "أول صورة جوية في العالم", image: 6, desc: "تعتبر الصورة التي إلتقطها المصور لمدينة بوسطون في عام 1860 من على منطاد تعتبر أول صورة جوية في العالم مع أنها في الحقيقة لم تكن التجربة الأولى للتصوير من الهواء فقبلها بسنوات قليلة في فرنسا تم إلتقاط صور جوية من على منطاد لمدينة باريس إلا أن تلك الصور ضاعت ولم يتم أرشفتها أو حفظها ولذلك فقد وقف الحظ مع هذه الصورة لتحصل على لقب اول صورة جوية"),
        Fact(title: "بحار يزيل الأصفادالحديدية من قدم رجل أفريقي", image: 7, desc: "إستخدمت الأصفاد الحديدية لتقييد العبيد وفي هذه الصورة يقوم تاجر بريطاني بإزالة هذه الأصفاد بعد إلغاء العبودية في بدايات القرن التاسع عشر"),
        Fact(title: "إغتيال على الهواء مباشرةً", image: 8, desc: "في الثاني من أكتوبر عام 1960 هوجم أسانوما خلال مناظرة بُثت على التلفاز من قبل فتى في السابعة عشرة من عمره اسمه ”أوتويا ياماغوتشي“ حيث أرداه قتيلاً بالسيف وانتحر بعد عدة أسابيع"),
        Fact(title: "حشرة عملاقة", image: 9, desc: "تم تداول هذه الصورة على الأنترنت على أساس أنها غير معدلة ولكنها في الحقيقة ليست سوى بطاقة بريدية طريفة كانت هذه البطاقات شائعة في الثلاثينيات")
    ]
    
}

struct Fact {
    var title: String
    var image: Int
    var desc: String
    
    var imageFormatted: UIImage? {
        return UIImage(named: String(image))
    }
}
