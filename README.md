# Clima-Section-13

## Section content can be seen below:


![Clima Section 13](Documentation/ss-1.png)



## Key concepts shown in this section are:

143 - Dark mode, vector assets, SF Symbols<br>
144 - UITextFieldDelegate, textFieldShouldReturn, textFieldShouldEndEditing, textFieldDidEndEditing<br>
145 - Protocols<br>
147 - Protocols, Delegates<br>
149 - URLSession<br>
150 - Closures<br>
151 - JSON Decoding<br>
152 - Computed property, stored properties, switch-case, range operator<br>
153 - Encodable protocol, codable, delegate and protocol example<br>
155 - Method naming conventions external/internal name, delegate’s source object as the first argument<br>
156 - DispatchQueue, Completion Handler<br>
157 - Extensions allow us to add extra functionality to our existing classes, structures, or other data types just like protocols<br>
158 - Extensions using protocols, //MARK concept, code organizing<br>
159 - RequestLocation , startUpdatingLocation, Core Location CLLocationManager, didUpdateLocations<br>


## Scheme of Delegate Design Pattern:

![Clima Section 13](Documentation/ss-2.png)

- The delegation design pattern is a behavioral pattern in Swift that allows one object to act on behalf of another object. In Swift, this is often achieved through the use of protocols and delegate properties. 

- It allows an object (WeatherManager) to notify another object (WeatherViewController) about certain events or data changes without tightly coupling the two classes. The delegate methods are implemented in the delegate class to define the behavior when these events occur
