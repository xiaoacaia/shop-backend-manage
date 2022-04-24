import axios, { AxiosRequestConfig } from 'axios'
class HttpRequest {
  getInsideConfig() {
    const config = {
      headers: {}
    }
    return config
  }
  req(options: AxiosRequestConfig<any>) {
    const instance = axios.create()
    options = Object.assign(this.getInsideConfig(), options)
    // this.interceptors(instance, options.url)
    return instance(options)
  }
}
export default new HttpRequest()