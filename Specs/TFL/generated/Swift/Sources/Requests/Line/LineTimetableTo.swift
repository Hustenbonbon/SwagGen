//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension TFL.Line {

    /** Gets the timetable for a specified station on the give line with specified destination */
    public enum LineTimetableTo {

        public static let service = APIService<Response>(id: "Line_TimetableTo", tag: "Line", method: "GET", path: "/Line/{id}/Timetable/{fromStopPointId}/to/{toStopPointId}", hasBody: false, securityRequirements: [])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The originating station's stop point id (station naptan code e.g. 940GZZLUASL, you can use /StopPoint/Search/{query} endpoint to find a stop point id from a station name) */
                public var fromStopPointId: String

                /** A single line id e.g. victoria */
                public var id: String

                /** The destination stations's Naptan code */
                public var toStopPointId: String

                public init(fromStopPointId: String, id: String, toStopPointId: String) {
                    self.fromStopPointId = fromStopPointId
                    self.id = id
                    self.toStopPointId = toStopPointId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: LineTimetableTo.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(fromStopPointId: String, id: String, toStopPointId: String) {
                let options = Options(fromStopPointId: fromStopPointId, id: id, toStopPointId: toStopPointId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "fromStopPointId" + "}", with: "\(self.options.fromStopPointId)").replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)").replacingOccurrences(of: "{" + "toStopPointId" + "}", with: "\(self.options.toStopPointId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = TimetableResponse

            /** OK */
            case status200(TimetableResponse)

            public var success: TimetableResponse? {
                switch self {
                case .status200(let response): return response
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(TimetableResponse.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
