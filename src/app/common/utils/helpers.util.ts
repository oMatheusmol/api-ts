const jimp = require('jimp');

const Helpers = {
  dateFormat: (date: string) => {
    let formatedDate: any = new Intl.DateTimeFormat('pt-BR').format(new Date(date));
    formatedDate = formatedDate.split('/');
    formatedDate = `${formatedDate[2]}-${formatedDate[1]}-${formatedDate[0]}`;

    return formatedDate;
  },

  hourFormat: (date: string, hour: string) => {
    return `${date} ${hour.substring(0, 2)}:${hour.substring(3)}`;
  },

  hourUnformat: (hour: string) => {
    return hour.replace(':', '');
  },

  brFormatToDate: (date: string) => {
    try {
      const dateParts = date.split('/');
      return new Date(+parseInt(dateParts[2]), parseInt(dateParts[1]) - 1, +parseInt(dateParts[0]));
    } catch (err) {
      return new Date();
    }
  },

  imageToBase64: (imageData: string): Promise<string> => {
    return new Promise((resolve, reject) => {
      jimp.read(imageData).then((image) => {
        return image.quality(60).getBase64(jimp.MIME_JPEG, (err, base64) => {
          if (err) reject(err);
          resolve(base64);
        });
      });
    });
  },
};

export default Helpers;
