//
//  ViewController.swift
//  ARHacking
//
//  Created by Martin Mitrevski on 08.09.18.
//  Copyright © 2018 Mitrevski. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var descriptionTextVieew: UITextView!
    
    @IBOutlet var sceneView: ARSCNView!
    
    static let jackVideo = Bundle.main.url(forResource: "maya", withExtension: "mp4")!
    static let goghVideo = Bundle.main.url(forResource: "gogh1", withExtension: "mp4")!
    static let queenVideo = Bundle.main.url(forResource: "queen", withExtension: "mp4")!
    static let monaVideo = Bundle.main.url(forResource: "monalisa", withExtension: "mp4")!
    static let spanishVideo = Bundle.main.url(forResource: "spanish", withExtension: "mp4")!
    static let billyVideo = Bundle.main.url(forResource: "billyray", withExtension: "mp4")!
    static let lipsVideo = Bundle.main.url(forResource: "rockyHorror", withExtension: "mp4")!
    let players = [ "maya" : AVPlayer(url: jackVideo),
                    "gogh" : AVPlayer(url:goghVideo),
                    "queen" : AVPlayer(url: queenVideo),
                    "monalisa" : AVPlayer(url: monaVideo),
                    "spanish" : AVPlayer(url: spanishVideo),
                    "billy" : AVPlayer(url: billyVideo),
                    "lips" : AVPlayer(url: lipsVideo)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        for (_, player) in players {
            videoObserver(for: player)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupImageTrackingConfiguration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Pause the view's session
        sceneView.session.pause()
        
    }
    
    func setupImageTrackingConfiguration() {
        let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "Whiskies", bundle: Bundle.main)!
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = referenceImages
        configuration.maximumNumberOfTrackedImages = 9
        sceneView.session.run(configuration)
    }
    
    func videoObserver(for videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: nil, queue: nil) { notification in
            videoPlayer.seek(to: CMTime.zero)
        }
    }
    
    func changeLabel(picture: String) {
        switch picture {
        case "maya":
            descriptionTextVieew.text = "Maya Angelou\n\nMaya Angelou was an American poet, author, writer, memoirist, and civil rights activist. She published seven autobiographies, three books of essays, several books of poetry, and was credited with a list of plays, films, and television shows spanning over 50 years. She received dozens of awards and more than 50 honorary degrees. Angelou was best known for her series of seven autobiographies, which focus on her childhood and early adult experiences. The first, I Know Why the Caged Bird Sings (1969), tells of her life up to the age of 17 and brought her international recognition and acclaim.\n\nAngelou became a poet and writer after a series of jobs as a young adult, including fry cook, sex worker, nightclub dancer and performer, and journalist in Egypt and Ghana during the decolonization of Africa. She was an actress, director, producer of plays, movies, and public television programs, and writer. Angelou was active in the Civil Rights Movement and worked with Martin Luther King, Jr. and Malcolm X.\n\nThe audio is an excerpt of the poem ‘Still I Rise’ by Maya, a powerful, empowering poem all about the struggle to overcome prejudice and injustice.\n\nTRANSCRIPT\n[Still I Rise\nYou may write me down in history\nWith your bitter, twisted lies,\nYou may trod me in the very dirt\nBut still, like dust, I'll rise.]"
        case "gogh":
            descriptionTextVieew.text = "Vincent van Gogh - Starry Night\n\nVincent Willem van Gogh was a Dutch post-impressionist painter. He suffered from anxiety and fits of mental illness. When he was 37, he committed suicide, never knowing how profound his legacy would be in the world of art, thinking he was a failure.\nDespite his difficulties, Vincent van Gogh created some of the most beautiful and well-revered paintings of the 19th century, including Starry Night, which can be seen in front of you.\n\nStarry Night depicts the view from the window of van Gogh’s asylum room at the Saint-Remy-de-Provence where he admitted himself after his famous breakdown where he mutilated his own ear. The period in his life was a trying one, to be sure, but amongst the darkness, van Gogh appreciated this view spectacularly and immortalized it through this piece. \"Through the iron-barred window,\" he wrote to his brother, Theo, \"I can see an enclosed square of wheat . . . above which, in the morning, I watch the sun rise in all its glory.\""
        case "queen":
            descriptionTextVieew.text = "Queen\n\nQueen was a British rock band that formed in London in 1970, and one of the most commercially successful music acts of all time. The band members were Freddie Mercury (bottom), Brian May (top), Roger Taylor (right), and John Deacon (left). Here they are recreating their famous formation from the Queen II cover and the Bohemian Rhapsody music video."
        case "monalisa":
            descriptionTextVieew.text = "Mona Lisa\n\nMona Lisa (also known as La Gioconda or La Joconde) is a 16th-century portrait painted in oil by Leonardo da Vinci during the Renaissance in Florence, Italy. \n\nOn August 21, 1911, the Mona Lisa was stolen. It was lost for two years, and everybody thought it would be lost forever. A worker at the Louvre, named Vincenzo Peruggia, had actually stolen it. He had hidden it in his coat and walked out with it after the museum had closed. He wanted the painting to go back to Italy and be shown in an Italian museum. After hiding it in his apartment for two years, he grew impatient and tried to sell it to a gallery in Florence, but was caught. It was shown all over Italy before going back to the Louvre. \nThe audio clip is from an art historian speaking about Mona Lisa’s famous smile.\n\nTRANSCRIPT\n[ It’s said that the Mona Lisa smile combine two ways we tend to look at women in our culture. In one way, she’s very mothering and nurturing, and in the other way she seems very seductive.]"
        case "spanish":
            descriptionTextVieew.text = "Flamenco\n\nOriginally from Southern Spain, specifically the Andalusia region, Flamenco as a traditional Spanish dancing style has only been documented for the past two hundred years. Today it is practiced throughout Spain and around the world.\n\nThe Spanish art form is made up of three parts: guitarra (guitar playing), cante (song), and baile (dance). Although flamenco originated in Andalucia, historians agree that it is influenced by many other cultures, including Latin American, Cuban, and Jewish traditions. Gypsies, or the Roma people, brought flamenco from its roots in Andalusia to the rest of Spain. Romani culture places importance on moving frequently, as they do not consider themselves true citizens of the countries they were born in, but rather citizens of their Romani community. They also have a reputation for influencing many different types of music, including compositions of famous classical composers Franz Liszt and Johannes Brahms. Some even speculate that flamenco originates from the Roma people. Flamenco also traveled by boat to other continents through the vast immigration of the 1800s and 1900s."
        case "billy":
            descriptionTextVieew.text = "Old Town Road\n\n\"Old Town Road\" is a song by American rapper Lil Nas X. It was initially released independently on December 3, 2018, and gained popularity on social video sharing app TikTok. A remix of the song featuring Billy Ray Cyrus was released on April 5, 2019. In March 2019, the song reached number 19 on the Billboard Hot Country Songs chart before the magazine disqualified it from being included on the chart on grounds that it did not fit the country genre, sparking a debate on the definition of the genre. Had it not been disqualified, \"Old Town Road\" would have been the Hot Country Songs number-one song, as of the chart dated April 6, 2019.\n\nThough the song was not re-entered onto the country charts, both the original version of the song and the remix featuring Cyrus eventually reached number one on the flagship Billboard chart, the Hot 100."
        default:
            descriptionTextVieew.text = ""
        }
    }

    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        if let imageAnchor = anchor as? ARImageAnchor {
            let player = players[imageAnchor.name!]!
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            plane.firstMaterial?.diffuse.contents = player
            player.seek(to: CMTime.zero)
            player.play()
            
            changeLabel(picture: imageAnchor.name!)

            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            node.addChildNode(planeNode)
        }
        return node
    }
    
    
    @objc func playerItemDidReachEnd(notification: NSNotification) {
        if let playerItem: AVPlayerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero)
        }
    }
    
    @IBAction func taraLabel(_ sender: Any) {
        print("hey")
        self.viewWillAppear(true)
    }
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else {
            return
        }
//        if let pointOfView = sceneView.pointOfView {
//            let isVisible = sceneView.isNode(node, insideFrustumOf: pointOfView)
//            if isVisible {
//                let player = players[imageAnchor.name!]!
//                if player.rate == 0 {
//                    player.play()
//                }
//            }
//        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
