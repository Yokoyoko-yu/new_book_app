export const searchBookImage=async(isbn)=>{
    const replace_isbn=isbn.replace(/-/g,'')
    console.log(`isbn:${replace_isbn}`)
    //画像の取得
    try{
      const response= await fetch(`https://ndlsearch.ndl.go.jp/thumbnail/${replace_isbn}.jpg`,{
              method:'get',
              mode: 'no-cors'
      })
      return response
    }catch(err){
      alert('一部書籍情報が取得できず')
    }
}