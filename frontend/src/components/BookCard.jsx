import * as React from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import CardActionArea from '@mui/material/CardActionArea';
import { searchBookImage } from './searchBookImage';
import { BookAddButton } from './BookAddButton';

export const BookCard=({isbn,author,title,publisher})=>{

  return (
    <Card sx={{ width:"400px" }}>
      <CardActionArea>
        {/* 写真 */}
        <CardMedia
          component="img"
          height="300"
          image={`https://ndlsearch.ndl.go.jp/thumbnail/${isbn}.jpg`}
          alt="写真が見つかりませんでした"
            sx={{
                  height: 300,
                  width: '100%',
                  objectFit: 'contain', // ★重要：画像を縮小して全体を表示
                  backgroundColor: '#f5f5f5' // 背景色で余白を補うと見た目も整う
                }}
        />
        {/* 本の情報 */}
        <CardContent>
          <Typography gutterBottom variant="h6" component="div">
            {title}
          </Typography>
          <Typography variant="body2" sx={{ color: 'text.secondary' }}>
            {author}
          </Typography>
          <Typography variant="body2" sx={{ color: 'text.secondary' }}>
            {publisher}
          </Typography>
          <Typography variant="body2" sx={{ color: 'text.secondary' }}>
            {isbn}
          </Typography>
          <Typography variant="body2" sx={{ color: 'text.secondary' }}>
            <BookAddButton isbn={isbn} />
          </Typography>
        </CardContent>
      </CardActionArea>
    </Card>
  );
}

export default BookCard;